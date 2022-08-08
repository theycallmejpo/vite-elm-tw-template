import "./style.css";
import {Elm} from "./Main.elm";

const app = document.querySelector<HTMLDivElement>("#app")!;

Elm.Main.init({node: app});
