module Main exposing (main)

import Browser
import Css
import Css.Global
import Html.Events exposing (onClick)
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (onClick)
import Svg.Styled as Svg exposing (path, svg)
import Svg.Styled.Attributes as SvgAttr
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }


fakeVaults =
    List.repeat 10 { above = 10, below = 4, inRange = 6 }


view : Model -> Html Msg
view model =
    Html.div [] [ Css.Global.global Tw.globalStyles, mytable fakeVaults ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view >> toUnstyled
        , update = update
        }


type alias Vault =
    { above : Int, below : Int, inRange : Int }


mytable : List Vault -> Html msg
mytable vaults =
    let
        tableRows =
            List.indexedMap row vaults
    in
    div
        [ css
            [ Tw.flex
            , Tw.flex_col
            ]
        ]
        [ div
            [ css
                [ Tw.neg_my_2
                , Tw.overflow_x_auto
                , Bp.lg
                    [ Tw.neg_mx_8
                    ]
                , Bp.sm
                    [ Tw.neg_mx_6
                    ]
                ]
            ]
            [ div
                [ css
                    [ Tw.py_2
                    , Tw.align_middle
                    , Tw.inline_block
                    , Tw.min_w_full
                    , Bp.lg
                        [ Tw.px_8
                        ]
                    , Bp.sm
                        [ Tw.px_6
                        ]
                    ]
                ]
                [ div
                    [ css
                        [ Tw.shadow
                        , Tw.overflow_hidden
                        , Tw.border_b
                        , Tw.border_gray_200
                        , Bp.sm
                            [ Tw.rounded_lg
                            ]
                        ]
                    ]
                    [ table
                        [ css
                            [ Tw.min_w_full
                            , Tw.divide_y
                            , Tw.divide_gray_200
                            ]
                        ]
                        [ thead
                            [ css
                                [ Tw.bg_gray_50
                                ]
                            ]
                            [ tr []
                                [ th
                                    [ Attr.scope "col"
                                    , css
                                        [ Tw.px_6
                                        , Tw.py_3
                                        , Tw.text_left
                                        , Tw.text_xs
                                        , Tw.font_medium
                                        , Tw.text_gray_500
                                        , Tw.uppercase
                                        , Tw.tracking_wider
                                        ]
                                    ]
                                    [ text "Name" ]
                                , th
                                    [ Attr.scope "col"
                                    , css
                                        [ Tw.px_6
                                        , Tw.py_3
                                        , Tw.text_left
                                        , Tw.text_xs
                                        , Tw.font_medium
                                        , Tw.text_gray_500
                                        , Tw.uppercase
                                        , Tw.tracking_wider
                                        ]
                                    ]
                                    [ text "Title" ]
                                , th
                                    [ Attr.scope "col"
                                    , css
                                        [ Tw.px_6
                                        , Tw.py_3
                                        , Tw.text_left
                                        , Tw.text_xs
                                        , Tw.font_medium
                                        , Tw.text_gray_500
                                        , Tw.uppercase
                                        , Tw.tracking_wider
                                        ]
                                    ]
                                    [ text "Email" ]
                                , th
                                    [ Attr.scope "col"
                                    , css
                                        [ Tw.px_6
                                        , Tw.py_3
                                        , Tw.text_left
                                        , Tw.text_xs
                                        , Tw.font_medium
                                        , Tw.text_gray_500
                                        , Tw.uppercase
                                        , Tw.tracking_wider
                                        ]
                                    ]
                                    [ text "Role" ]
                                , th
                                    [ Attr.scope "col"
                                    , css
                                        [ Tw.relative
                                        , Tw.px_6
                                        , Tw.py_3
                                        ]
                                    ]
                                    [ span
                                        [ css
                                            [ Tw.sr_only
                                            ]
                                        ]
                                        [ text "Edit" ]
                                    ]
                                ]
                            ]
                        , tbody [] tableRows
                        ]
                    ]
                ]
            ]
        ]


row : Int -> Vault -> Html msg
row index vault =
    let
        even =
            modBy 2 index == 0
    in
    tr
        [ css
            [ if even then
                Tw.bg_white

              else
                Tw.bg_gray_50
            ]
        ]
        [ td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_sm
                , Tw.font_medium
                , Tw.text_gray_900
                ]
            ]
            [ text "Jane Cooper" ]
        , td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_sm
                , Tw.text_gray_500
                ]
            ]
            [ text "Regional Paradigm Technician" ]
        , td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_sm
                , Tw.text_gray_500
                ]
            ]
            [ text "jane.cooper@example.com" ]
        , td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_sm
                , Tw.text_gray_500
                ]
            ]
            [ text "Admin" ]
        , td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_right
                , Tw.text_sm
                , Tw.font_medium
                ]
            ]
            [ a
                [ Attr.href "#"
                , css
                    [ Tw.text_indigo_600
                    , Css.hover
                        [ Tw.text_indigo_900
                        ]
                    ]
                ]
                [ text "Edit" ]
            ]
        ]
