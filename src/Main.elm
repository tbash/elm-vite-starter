module Main exposing (main)

import Browser exposing (Document)
import Html
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model =
    { count : Int }


init : ( Model, Cmd Msg )
init =
    ( { count = 0 }
    , Cmd.none
    )


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }
            , Cmd.none
            )

        Decrement ->
            ( { model | count = model.count - 1 }
            , Cmd.none
            )


view : Model -> Document Msg
view model =
    { title = "App"
    , body =
        [ Html.div [ Attributes.class "container mx-auto max-w-sm" ]
            [ Html.button [ Events.onClick Increment ] [ Html.text "+1" ]
            , Html.div [] [ Html.text <| String.fromInt model.count ]
            , Html.button [ Events.onClick Decrement ] [ Html.text "-1" ]
            ]
        ]
    }


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
