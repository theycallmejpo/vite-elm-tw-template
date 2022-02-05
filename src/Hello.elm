module Hello exposing (main)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    Int


initialModel : Model
initialModel =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 143

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button
            [ onClick Increment
            , class "border border-blue-600 bg-blue-300 text-black text-xs py-1 px-3 rounded"
            ]
            [ text "+1" ]
        , p
            [ class "text-sm font-bold inline-block w-10 text-center" ]
            [ text <| String.fromInt model ]
        , button
            [ onClick Decrement
            , class "border border-blue-600 bg-blue-300 text-black text-xs py-1 px-3 rounded"
            ]
            [ text "-1" ]
        ]
