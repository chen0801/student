package com.cj.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author  chenjun
 * @create  2021/1/26 11:31
 * @desc    redis连接池
 **/
public class RedisConnection {
    /**
     * Redis服务器IP
     */
    private static String HOST = "8.131.54.116";
    /**
     * Redis的端口号
     */
    private static int PORT = 6379;
    /**
     * 可用连接实例的最大数目，默认值为8
     */
    private static int MAX_ACTIVE = 1024;
    /**
     * 控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8
     */
    private static int MAX_IDLE = 200;
    private static int MAX_WAIT = 10000;

    private static JedisPool jedisPool = null;
    /**
     * 初始化redis连接池
     */
    private static void initPool(){
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            //最大连接数
            config.setMaxTotal(MAX_ACTIVE);
            //最大空闲连接数
            config.setMaxIdle(MAX_IDLE);
            //获取可用连接的最大等待时间
            config.setMaxWaitMillis(MAX_WAIT);
            jedisPool = new JedisPool(config, HOST, PORT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取jedis实例
     */
    public synchronized static Jedis getJedis() {
        try {
            if(jedisPool == null){
                initPool();
            }
            Jedis jedis = jedisPool.getResource();
            //密码
            jedis.auth("123456");
            return jedis;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
