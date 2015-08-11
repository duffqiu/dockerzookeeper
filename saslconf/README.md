#### Note

Zookeeper support SSL by netty after release 3.5.1, check issue [2125](https://issues.apache.org/jira/browse/ZOOKEEPER-2125)

### keystore generation

```
keytool -genkeypair -alias certificatekey -keyalg RSA -validity 7 -keystore keystore.jks
keytool -export -alias certificatekey -keystore keystore.jks -rfc -file cert.cer
keytool -import -alias certificatekey -file cert.cer -keystore truststore.jks
```

the password I set is `duffqiu`
