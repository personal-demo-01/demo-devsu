import app from "./app";

const port = process.env.PORT || 8090;

const index = () => {
  app.listen(port, () => console.log(`Listening on port ${port}...`));
}

index();