class Conn {
  OscP5 oscP5;
  NetAddress conn;

  Conn(int port, String ip) {
    oscP5 = new OscP5(this, port);
    this.conn = new NetAddress(ip, port);
  }
  void sendLine(String action, String second, String first) {
    //action = "remove" or action = "connect"
    //first and second is the name of pd element(delay, osc, dac, adc...)
    OscMessage message = new OscMessage("/"+second);
    message.add("/"+action);
    message.add("/"+first);
    if (action == "remove") {
      message.add(0);
    } else if (action == "connect") {
      message.add(1);
    }
    oscP5.send(message, this.conn);
  }

  void command(String action, String name, float value) {
    OscMessage message = new OscMessage("/"+name);
    message.add("/"+action);
    message.add(value);
    oscP5.send(message, this.conn);
  }

  void command(String action, String name, String value) {
    OscMessage message = new OscMessage("/"+name);
    message.add("/"+action);
    message.add(value);
    oscP5.send(message, this.conn);
  }

  void command(String action, String name, int value) {
    OscMessage message = new OscMessage("/"+name);
    message.add("/"+action);
    message.add(value);
    oscP5.send(message, this.conn);
  }
}
