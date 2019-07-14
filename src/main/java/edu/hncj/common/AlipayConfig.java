package edu.hncj.common;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id ="2016092400582306";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDDv0JFUGdcqUflOGBvyL5tiEdYNGlKXRfu7hKqbTe+RRY5L0Q1PbgxG4p5XC9n1NRtZSOhejoDxSS0FCFcKVJBrUKoVFTj154DNCuxmfOgdaEvuRjL+q0lQc9a2T/Ao9TUxkgfTCOSpMrChAlz+WhBXlXYtr4IYy2AESvJD4rZ/5lFiGGVpq46Xcyc9O7lJeKu70sKbUwr+ViBNqOViDhVn5PWfnO8TwfNjLV0ZNaFfXf7XC6woBCru3uc+BcHjbwpRz90kNOG74xSOcTGR5SH4sjxiGfKGQc34Cg7wa1sMyFv77XmXKzGY28/3dt3WdDGcqwVte7c8Wjq5diCQu57AgMBAAECggEAIsN5yoOQB8XMjenoPpIBN8SnHwQX2uwTjwxa5keFSdZNLxS04Vu3tYj1m74CcUc7/r2iiVACs560eQLGNe7ku+NAXlKzzM8DMgB27hCwUsPxP195BujbDS3V3IWOq/CsoKkiL+S+wJFhrQ/z+dPGby2Iw3cY4rZyYzcpdoi7GSHauSF0wIHt6pxe1TunUnYuwu+2AaZIgsD7hw1QkmV397w5g+p8rqpwm7tPvA7rRT0mytsggFJH5DKW3gOGMfwaak4nDWglJOFs6Z0VwHHCntCbE2syl6cB9Zzg68YbNloTmunBxMQ0lGFdLRzyhj5K+8SHsYM5dx8q4+Q5lTroWQKBgQD3GId88vkZVCxibRwMAm3Mch2IefTc7vimiivD7KSnPh1sJLdxA3UTxVAqYooJd0RChzhtNuC+cXMFVMyWQxETlq0VaYv1AAe2eUMpeIm/kFjhmb/GJjqhutiCtny7TPtAf7TCJ+EkHYUyN8zm4LHv5TaU+xgRswCa1owDBQ5H3QKBgQDKzQkIqgJoNyZ+2VSCD58vAFg9IneNG1FHWro0R+l5tOaI6MlwXSbGm9MnpOYkqIJdEQgqiTFREsqa6Y+NwWELwt5oKqpeoBlwS7B6f1nc9eJTeElNUIQ0Eu3x1DV2K4HTrPYooW1+TyEzdAPat9mrkASQjzxtLflLeMcSoA6WNwKBgQDJnzZO+mPQCyL8XVOZaRH21NbMWdc3v7cdDXmQsTPZU5HmgD8+9DdAHqy/KRDBkJQeRQAB/dl9DE1yeDNIGQmCFly9MBaHn7Krbl8jI7wil8Ius6oMIX2OIkwwvH8ixjnt80andqr7MStSQr3rVkVbHolfH1QQfSNtNMuiWym/8QKBgDkjldUEGZOFXmpFD4NppV8XyMTIzkhKlxb0oBwU2tp4tq+Cbycih8dTpiW4V0Oi2sAgCV36s5N1KPKGtfSptI8cw48z3ja1AxXZrYqGESqpeLAt5vFKq0UExFfrg3ic/4JFbEG8Yd5Bq0gU+vUH8eNdu3uDb/IPDvtNt0EvKYz3AoGAK41e6XXZdGwsCL5Dz2Cfr8Vz67AbApuH8xVd+JBHZEAEIER4hrE0F2OUOYL7NBCDKmRgyZlz4mcVOhH+ckR+4GVaRM0VL7VAvzQBbAB8jfcHiIaWRvWUJ8MdTD0BFb3SNC6wB5bLHoT8dOR9lFRLmaY9bF+1bpqYOKvhzoVdF2Y=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw79CRVBnXKlH5Thgb8i+bYhHWDRpSl0X7u4Sqm03vkUWOS9ENT24MRuKeVwvZ9TUbWUjoXo6A8UktBQhXClSQa1CqFRU49eeAzQrsZnzoHWhL7kYy/qtJUHPWtk/wKPU1MZIH0wjkqTKwoQJc/loQV5V2La+CGMtgBEryQ+K2f+ZRYhhlaauOl3MnPTu5SXiru9LCm1MK/lYgTajlYg4VZ+T1n5zvE8HzYy1dGTWhX13+1wusKAQq7t7nPgXB428KUc/dJDThu+MUjnExkeUh+LI8YhnyhkHN+AoO8GtbDMhb++15lysxmNvP93bd1nQxnKsFbXu3PFo6uXYgkLuewIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost/bookstore/exception";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://192.168.0.109/bookstore/order/orderSuccess";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

