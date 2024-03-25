import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Box, CardMedia } from "@mui/material";

import { Videos, ChannelCard } from ".";
import { getLoginAPI, loginFacebookAPI } from "../utils/fetchFromAPI";

import FacebookLogin from "react-facebook-login";

const Login = () => {
  const [channelDetail, setChannelDetail] = useState();
  const [videos, setVideos] = useState(null);

  const { id } = useParams();
  const navigate = useNavigate();

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
            <input className="form-control" id="pass" />
          </div>
          <div className="col-12">
            <button
              type="button"
              className="btn btn-primary"
              onClick={() => {
                let email = document.querySelector("#email").value;
                let pass_word = document.querySelector("#pass").value;

                getLoginAPI({ email, pass_word })
                  .then((result) => {
                    alert(result.message);
                    // Lưu token
                    localStorage.setItem("LOGIN_USER", result.content);
                    window.location.reload();
                  })
                  .catch((err) => {
                    alert(err.response.data.message);
                  });
              }}>
              Login
            </button>
          </div>
          <FacebookLogin
            appId="351573283893078"
            callback={(response) => {
              console.log(response);

              let model = {
                faceAppId: response.id,
                full_name: response.name,
              };
              loginFacebookAPI(model)
                .then((result) => {
                  alert(result.message);
                  // Lưu token
                })
                .catch((err) => {
                  alert(err.response.data.message);
                });
            }}
          />
        </form>
      </div>
    </div>
  );
};

export default Login;
