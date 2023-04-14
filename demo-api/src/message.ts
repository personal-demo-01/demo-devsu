export default interface Message {
  message: string;
  to: string;
  from: string;
  timeToLiveSec: number;
}