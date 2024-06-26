import React, { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { Box, CardMedia } from "@mui/material";

import { Videos, ChannelCard } from ".";
import { BASE_URL, loginAPI, loginFacebookAPI } from "../utils/fetchFromAPI";
import ReactFacebookLogin from "react-facebook-login";

const Login = () => {
  const [channelDetail, setChannelDetail] = useState();
  const [videos, setVideos] = useState(null);

  const navigate = useNavigate();

  const { id } = useParams();
  useEffect(() => {}, []);
  return (
    <div className="p-5 " style={{ minHeight: "100vh" }}>
      <div className=" d-flex justify-content-center">
        <form className="row g-3 text-white">
          <div className="col-md-12">
            <label htmlFor="inputEmail4" className="form-label">
              Email
            </label>
            <input type="email" className="form-control" id="email" />
          </div>

          <div className="col-md-12">
            <label htmlFor="inputEmail4" className="form-label">
              Password
            </label>
            <input className="form-control" id="pass" type="password" />
          </div>
          <div className="col-12">
            <button
              type="button"
              className="btn btn-primary"
              onClick={() => {
                let email = document.querySelector("#email").value;
                let pass_word = document.querySelector("#pass").value;

                loginAPI({ email, pass_word })
                  .then((result) => {
                    alert(result.message);
                    // lưu token
                    console.log(result);
                    localStorage.setItem("LOGIN_USER", result.content);

                    window.location.reload();
                    // navigate("/video/get-video")
                  })
                  .catch((error) => {
                    alert(error.response.data.message);
                  });
              }}>
              Login
            </button>
          </div>

          <ReactFacebookLogin
            appId="1325538944777742"
            callback={(response) => {
              console.log(response);

              let model = {
                faceAppId: response.id,
                full_name: response.name,
              };
              loginFacebookAPI(model)
                .then((result) => {
                  alert(result.message);
                  // lưu token
                })
                .catch();
            }}
          />
        </form>
      </div>
    </div>
  );
};

export default Login;
