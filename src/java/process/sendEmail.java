/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author bryan
 */
// host outlook smtp-mail.outlook.com


public class sendEmail {
    private String Host;
    private String correoE;
    private String password;
    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the correoE
     */
    public String getCorreoE() {
        return correoE;
    }

    /**
     * @param correoE the correoE to set
     */
    public void setCorreoE(String correoE) {
        this.correoE = correoE;
    }
     
    /**
     * @return the host
     */
    public String getHost() {
        return Host;
    }

    /**
     * @param host the host to set
     */
    public void setHost(String host) {
        this.Host = host;
    }
   
   
    
    public boolean enviarCorreo(String para, String mensaje, String asunto){
        boolean enviado = false;
            try{
                String host = getHost();
                String correo = getCorreoE();
                String pass = getPassword();
                Properties prop = System.getProperties();
                prop.put("mail.smtp.starttls.enable","true");
                prop.put("mail.smtp.host", host);
                prop.put("mail.smtp.user",correo);
                prop.put("mail.smtp.password", pass);
                prop.put("mail.smtp.port",587);
                prop.put("mail.smtp.auth","true");
                
                Session sesion = Session.getDefaultInstance(prop,null);
                
                MimeMessage message = new MimeMessage(sesion);
                
                message.setFrom(new InternetAddress(correo));
                
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));
                
                message.setSubject(asunto);
                message.setText(mensaje);
                
                Transport transport = sesion.getTransport("smtp");
                
                transport.connect(host,correo,pass);
                
                //transport.sendMessage(message, message.getAllRecipients());
                
                enviado = true;
                              
                transport.close();
                
            }catch(MessagingException e){
                System.out.print(e.getMessage());
            }
        
        return enviado;
    }
}
