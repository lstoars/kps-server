package com.kps.server.utils;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import java.io.InputStream;

/**
 * User: hcf
 * Date: 13-12-24
 * Time: 下午2:11
 * To change this template use File | Settings | File Templates.
 */
public class CommandUtils {

    public static String sshExecute(String host, String user, String pwd,
                                    String command) {
        String osName = System.getProperty("os.name");
// ps -ef|grep tomcat|grep -v grep|awk '{print $2}'
        StringBuffer sb = new StringBuffer();
        try {
            JSch jsch = new JSch();
            if (osName.toUpperCase().indexOf("WINDOWS") > -1) {
                jsch.setKnownHosts("c:\\known_hosts");
            } else {
                jsch.setKnownHosts("/root/.ssh/known_hosts");
            }
            Session session = jsch.getSession(user, host, 22);
            session.setPassword(pwd);
            session.connect();
            Channel channel = session.openChannel("exec");
            ((ChannelExec) channel).setCommand(command);
            InputStream in = channel.getInputStream();
            channel.connect();
            int nextChar;
            while (true) {
                while ((nextChar = in.read()) != -1) {
                    sb.append((char) nextChar);
                }
                if (channel.isClosed()) {
                    System.out.println("exit-status: "
                            + channel.getExitStatus());
                    break;
                }
                try {
                    Thread.sleep(1000);
                } catch (Exception ee) {
                }
            }
            channel.disconnect();
            session.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();

    }
}
