import express from "express";
import bodyParser from "body-parser";
import Message from "./message";
import jwt from "jsonwebtoken";

const accessTokenSecret = process.env.SECRET_TOKEN

const authenticateJWT = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (authHeader) {
    const token = authHeader.split(' ')[1];

    jwt.verify(token, accessTokenSecret, (err, user) => {
      if (err) {
        return res.sendStatus(403);
      }

      req.user = user;
      next();
    });
  } else {
    res.sendStatus(401);
  }
}

const app = express();
app.use(bodyParser.json())

app.get("/", (req, res) => { res.send('Healthcheck endpoint...') });
app.post("/devops", authenticateJWT, async (req, res) => {
  let messge: Message = req.body;
  res.status(200).send("Hello " + messge.to + ", your message will be sent.");
});


export default app;