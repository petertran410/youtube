import React from "react";
import { io } from "socket.io-client";

const DemoSocket = () => {
  // Đối tượng socket cliet
  let socket = io("ws://localhost:8080");

  return <div>DemoSocket</div>;
};

export default DemoSocket;
