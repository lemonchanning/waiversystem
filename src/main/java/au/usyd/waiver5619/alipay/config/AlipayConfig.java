package au.usyd.waiver5619.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
	

	public static String app_id = "2016102500758463";

    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC3WYiUel9HJOAlyTQq2UDGEdz4as58LhOmImm6V+HOPQm2wFj7zUMGf21jfN7yxMDM5QVY6yGo8QdoScpaHgykJ3J5B+lfsYual0iT0eDb7nWZs04UF29GaIaDOcLrztFWztE19VS3VXkiDP/h0uj8hhp0YI4UGAyjpdsinClyuGjvJ6XYn97Pv77+na2Qu+Uq9RZ+jUppPMl2nxk3kqJ1F8t7f6iWVIf6bpkqWGdnzI8eq4rmHywNm206utJ3kcSqWApBPALHr3U0Rx8QXuaGP5fLL3sDFVptEaRujlyefh86T+eY5B2s3gaG5t34nR0hCxb18MxvijH/2puZ3wUvAgMBAAECggEAA7to0kzjX5lajqpXy398mAuJCe1yooh1ke4lZMuhJweLCRNFPGrjMGCro1jJWPu0SPdocnTmzH+LfQ3zdn4iF71N0TTeBTqh8tWdfpTJFPD3p9dEgZgwhahfBJDKbO5ayH+RNp31yX2N56mIE9qtL2azZycH/VS3/STFHyE6nsElQgN3R6yMmiRrrvDP2FV3PMsm8CCka3zSLvzSOtDHihxv0eYHYpwGNvi+F1kcwb0YB2n0UE4mQq0YyLI49l9rDrewesSX3AbJZY9dc9Dy5G25yMYnEvCPUZpKvu6tIzTU/rUFOHm0VcnGeVzBOkX4BBjo7eV0+4TU7pNIs/3CcQKBgQD+yIdjDGeGjAoYLGIMj+yuGzDthb9F/Mn3mwC92vG2VL9cUxYBlNvjTNymk2Ja3pIoUn8b9Cyd6RsnigKP6KMBrE8/hdNwY+F1R0cUAdeYFBsjN7f2KCf/0+9UpVkldNEpRv7KggoQHezXYpm38Bf7A1bQ7tpmDV4P3GlzDHzkEwKBgQC4Oa1yK9Iy5wP7Ya6e3T9ei0cXEjd1n0HBZA+6/+/rMBYMdG+MBEVwSfroNaBwi/GFyd+5WqNh2KFiIcAAbdolOJ0Yjq5N8/4WHr/AwU5d6uxg5+qwyJMcAZrCsYXNQRgBK1mSP1uf4vmT3XHhhKTvDo7Y3xjq/mr9yltreVYl9QKBgQCKeyoDLwnR+qm969m7JDsrgsH8R/bnrneEKm6jwq4gQT3li49peqRtjihcLb2G0HS2j+hgpD3f8oR84Cl2WKbI0QQd7bo320H/AafjewDYuwzo/m7xz2+2QFZUNq8WicDp45m3LikUC3/grcoJTOlr2KvGUhzI3Tkj+9Qg4Ue8mwKBgAQAvNQOP7L7cgq0RKcPB6F2RUUrECluHG+nTPAzP3NMyC3dGc9hCGE4OktxXtsTL1xI1qOgZIxruJX5RcK8oFDOuhsefosTEiJI6MG3cYx43kn8wAy3Tvr8zfANC2s6Tts3peqXldYTiHi+BwtvZmYLWu87ab8xaAG7s+DR8h1BAoGBAOYKdK1v+kikuNSAufJBoOlSYsaDziboxRna4trIoBR3rUGJ/cOb1nmWuaKUJWc0pidf03gwF1WU4jZHBeZYzAP+yi8BS3of3bGP2GfJwAOFk2VkhTPrO94DzcVVWuZYwSJ8ou6HUY3SQ5iFXkko4QIhf3c7zQEQfTNGJijVzcrl";

    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjZNZzxuLU8r8qKpmNw5v77FHaPfW1CP+GWQUOPzGtUYhNVrPu65K09I/JyOvy4rApBE2bD8FuUArZrF9qZmD/QXl/Y0gYR0zq473XJdomTef350YRr372TeEM/Hiih4NOCiz916yrPCvRSvat8EEbSAUbzwZMIlqui58x82u0mw3Gy8Bhre8rSv4p5378z+hsVzM3MYC0+cXKIHQphUR7WG4l8Lvpkj0mGV1aWWyKfexiuh5lAtABz0AgZA45DlH2x+gz7VWiOa77QJQnBNI4FkVFKJC4FX1Q7BteFKJC5bPQprao/2XWqb6pt1tt1pblmkP2MwGTxukacYGPALh2QIDAQAB";

	public static String notify_url = "http://localhost:8080/waiver5619/notify_pay";

	public static String return_url = "http://localhost:8080/waiver5619/return";

	public static String sign_type = "RSA2";

	public static String charset = "utf-8";

	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	public static String log_path = "C:\\";


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

