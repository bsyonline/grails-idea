

import sun.misc.BASE64Encoder

import java.security.MessageDigest

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-9-17
 * version: 1.0
 */
class PasswordCodec {
    static encode = { str ->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(str.getBytes('UTF-8'))
        //return new MD5Encoder().encode()
        return (new BASE64Encoder()).encode(md.digest())
    }
}
