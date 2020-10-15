package com.yssy.redis;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

public class RedisCache implements Cache {
	// 定义一个ID
	private final String id;
	// 创建读写锁对象
	private final ReadWriteLock rwl = new ReentrantReadWriteLock();

	private static JedisConnectionFactory jedisConnectionFactory;

	// 为类中注入JedisConnectionFactory
	public static void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
		RedisCache.jedisConnectionFactory = jedisConnectionFactory;
	}

	// 通过构造方法给id赋值
	public RedisCache(String id) {
		this.id = id;
	}

	// 这个id实际上就是缓存的key
	public String getId() {
		return id;
	}

	// 将数据写入到缓存中(redis中)
	public void putObject(Object key, Object value) {
		// 写数据的时候加入锁,防止自己写的时候别人也写
		rwl.writeLock().lock();
		// 获取到redis连接
		RedisConnection redis = jedisConnectionFactory.getConnection();
		// 用于序列化数据(key,value)
		RedisSerializer<Object> ser = new JdkSerializationRedisSerializer();
		// 将key与value序列化 后存入到redis中
		redis.set(ser.serialize(key), ser.serialize(value));
		System.out.println("--- 添加二级缓存成功 key：" + key + " value：" + value + "-----------------");
		redis.close();
		// 写入完成后,放开锁
		rwl.writeLock().unlock();
	}

	// 从缓存中取出数据
	public Object getObject(Object key) {

		rwl.readLock().lock(); // 读锁
		// 获取到redis连接
		RedisConnection redis = jedisConnectionFactory.getConnection();
		// 用于序列化数据(key,value)
		RedisSerializer<Object> ser = new JdkSerializationRedisSerializer();
		// 根据序列化后的key从redis中取值,然后再将redis中取出的数据进行反序列化
		Object object = ser.deserialize(redis.get(ser.serialize(key)));
		System.out.println("-------------- 命中二级缓存成功 value：" + object + "----------------");
		redis.close();
		rwl.readLock().unlock(); // 放开锁
		// 将redis中取出的数据返回
		return object;
	}

	// 从缓存中删除数据
	public Object removeObject(Object key) {
		rwl.writeLock().lock(); // 读锁
		// 获取到redis连接
		RedisConnection redis = jedisConnectionFactory.getConnection();
		// 用于序列化数据(key,value)
		RedisSerializer<Object> ser = new JdkSerializationRedisSerializer();
		// 根据序列化后的key 将redis中对应的key声明周期设置为0
		Boolean expire = redis.expire(ser.serialize(key), 0);
		redis.close();
		rwl.writeLock().unlock(); // 放开锁
		return expire;
	}

	// 清空缓存
	public void clear() {
		rwl.readLock().lock();
		// 获取到redis连接
		RedisConnection redis = jedisConnectionFactory.getConnection();
		redis.flushDb();
		redis.flushAll();
		redis.close();
		rwl.readLock().unlock();
	}

	// 获得缓存中数据量
	public int getSize() {
		RedisConnection redis = jedisConnectionFactory.getConnection(); // 获取到redis连接
		Integer size = Integer.valueOf(redis.dbSize().toString());
		redis.close();
		return size;
	}

	// 获得读写锁
	public ReadWriteLock getReadWriteLock() {
		return rwl;
	}
}