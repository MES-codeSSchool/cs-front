module Data.Language exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)


type alias Language =
    { url : String
    , ref : String
    , name : String
    , comments : String
    , is_supported : Bool
    }


emptyLanguage : Language
emptyLanguage = {url = "", ref = "", name = "", comments = "", is_supported = False}


language : Decoder Language
language =
    Json.Decode.map5 Language
        (field "url" string)
        (field "ref" string)
        (field "name" string)
        (field "comments" string)
        (field "is_supported" bool)
