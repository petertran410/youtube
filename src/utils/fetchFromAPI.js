import axios from "axios";

export const BASE_URL = "http://localhost:8080";

const options = {
  params: {
    maxResults: 50,
  },
  headers: {
    "X-RapidAPI-Key": process.env.REACT_APP_RAPID_API_KEY,
    "X-RapidAPI-Host": "youtube-v31.p.rapidapi.com",
    token: localStorage.getItem("LOGIN_USER"),
  },
};

export const fetchFromAPI = async (url) => {
  const { data } = await axios.get(`${BASE_URL}/${url}`, options);

  return data;
};

// Khoá token => 401: token expired => API reset token => localStorage: token => reload()
export const getVideoAPI = async () => {
  const { data } = await axios.get(`${BASE_URL}/video/get-video`, options);

  return data.content;
};

export const getVideoTypeAPI = async () => {
  const { data } = await axios.get(`${BASE_URL}/video/get-video-type`, options);

  return data.content;
};

export const getVideoByTypeAPI = async (typeId) => {
  const { data } = await axios.get(
    `${BASE_URL}/video/get-video-by-type/${typeId}`,
    options
  );

  return data.content;
};

export const getVideoTypeId = async () => {
  const { data } = await axios.get(
    `${BASE_URL}/videoType/get-video-type-id`,
    options
  );

  return data.content;
};

// Khoá token => 401: token expired => API reset token => localStorage: token => reload()
export const getVideoPageAPI = async (page = 1) => {
  // trả về data, totalPage
  const { data } = await axios.get(
    `${BASE_URL}/video/get-video-page/${page}`,
    options
  );

  return data.content;
};

// Khoá token => 401: token expired => API reset token => localStorage: token => reload()
export const getVideoId = async (videoId) => {
  const { data } = await axios.get(
    `${BASE_URL}/video/get-video-id/${videoId}`,
    options
  );

  return data.content;
};

export const getCommentVideoId = async (videoId) => {
  const { data } = await axios.get(
    `${BASE_URL}/video/get-comment-video/${videoId}`,
    options
  );

  return data.content;
};

export const getSignUpAPI = async (model) => {
  const { data } = await axios.post(`${BASE_URL}/auth/signup`, model, options);

  return data;
};

export const getLoginAPI = async (model) => {
  const { data } = await axios.post(`${BASE_URL}/auth/login`, model, options);

  return data;
};

export const loginFacebookAPI = async (model) => {
  const { data } = await axios.post(
    `${BASE_URL}/auth/login-facebook`,
    model,
    options
  );

  return data;
};

export const commentAPI = async (model) => {
  const { data } = await axios.post(
    `${BASE_URL}/video/comment-video`,
    model,
    options
  );

  return data;
};

// interceptors => middleware khi nhận response từ BE về
axios.interceptors.response.use(
  (response) => response,
  (error) => {
    console.log(error.response.data);
    if (error.response.data === "TokenExpiredError") {
      // call API refresh
      axios
        .post(`${BASE_URL}/auth/token-ref`, "", options)
        .then((result) => {
          localStorage.setItem("LOGIN_USER", result.data.content);
          window.location.reload();
        })
        .catch((err) => {
          // logout => API logout

          // xoá local user
          localStorage.removeItem("LOGIN_USER");
        });
    }
  }
);
