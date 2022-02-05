import "./style.css";
import {Elm} from "./Hello.elm";

const app = document.querySelector<HTMLDivElement>("#app")!;

Elm.Hello.init({node: app});
