import React, { useState } from "react";
import { io } from "socket.io-client";

const DemoSocket = () => {
  // Đối tượng socket cliet
  let socket = io("ws://localhost:8080");
  socket.on("fe-connect", (data) => {
    // let noiDung = document.querySelector("#noiDung");
    // noiDung.innerHTML += data + " connect <br/>";
  });

  socket.on("fe-number", (data) => {
    let noiDung = document.querySelector("#noiDung");
    noiDung.innerHTML = data;
  });

  const beNumber = () => {
    socket.emit("number-be", "");
  };

  return (
    <div className="text-white">
      <h1 id="noiDung">0</h1>
      <button className="btn btn-success" onClick={beNumber}>
        Click
      </button>
    </div>
  );
};

export default DemoSocket;
