module Page.Questions.Code exposing (viewDetail, question)
import Codeschool.Model exposing (..)
import Codeschool.Msg exposing (..)
import Data.Question exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Html.Events.Extra exposing (..)
import Ui.Parts exposing (promoSimple, promoTable, simpleHero)
import Json.Decode as Json
import Dict

-- import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Ace

viewDetail : Model -> Html Msg
viewDetail model =
    div [ onClick Codeschool.Msg.DispatchLogin ]
        [ simpleHero question.questionInfo.title "" "simple-hero__page-blue"
        , div [ class "question-description" ]
            [
                Codeschool.Msg.toHtmlString """# Basic
        Codifique um software receba o ano de nascimento de uma
        pessoa e o ano atual. Calcule e mostre:
        - a) A idade dessa pessoa.
        - b) Quantos anos essa pessoa terá  em 2018."""
            ]

          , select [ class "select-language", on "change" (Json.map Codeschool.Msg.SetCodeLanguageType targetValueIntParse) ]
              [ option [ value "0", disabled True, selected True, class "disabled-item" ] [ text "Select language" ]
              , option [ value "1" ] [ text "C" ]
              , option [ value "2" ] [ text "Python" ]
              , option [ value "3" ] [ text "Java" ]
              , option [ value "4" ] [ text "elm" ]
              , option [ value "5" ] [ text "Java Script" ]
              ]
          , div [ class "item-question"]
              [ aceEditor model.selectedLanguange]
          , button [ class "send-button" ] [ text "Send to evaluation" ]
          , div [] [ text <| "Selected: " ++ (toString model.selectedLanguange) ]
          -- , button [ class "send-button", onClick Msg.GetLanguagesSuported ] [ text "Request Data" ]
        ]

question : CodeQuestion
question =
    { questionInfo = questionInfoExample
    , description =
        """Codifique um software receba o ano de nascimento de uma
        pessoa e o ano atual. Calcule e mostre:
        a) A idade dessa pessoa.
        b) Quantos anos essa pessoa terá  em 2018."""
    , acceptedLanguages = [Java, C, Cpp, Python2, Python]
    , selectedLanguage = ""
    , answer = ""
    }


aceEditor : String -> Html msg
aceEditor language =
   Ace.toHtml
      [ Ace.theme "solarized_dark"
      , Ace.enableBasicAutocompletion True
      , Ace.enableLiveAutocompletion True
      , Ace.tabSize 4
      , Ace.mode language
      , Ace.value ""
      ] []
