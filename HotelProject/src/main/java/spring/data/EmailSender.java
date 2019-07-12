package spring.data;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;

	public void SendEmail(EmailDto emdto) throws Exception {
		System.out.println(emdto);
		MimeMessage message = mailSender.createMimeMessage();
		try {

			message.setSubject(emdto.getSubject());
			message.setText(emdto.getContent());
			message.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(emdto.getReceiver()));
			mailSender.send(message);

		}catch(MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}

	}
}
