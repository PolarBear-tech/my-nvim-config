local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- py_manim
local py_manim_scene = s("manim", {
  t({ "from typing import override", "", "" }),
  t({ "from manim import Scene", "", "", "" }),
  t("class "),
  i(1, "scene_name"),
  t({ "(Scene):", "" }),
  t({ "\t@override", "" }),
  t({ "\tdef construct(self) -> None:", "\t\t" }),
  i(0, "pass"),
})

local py_manim_play = s("pl", {
  t("self.play("),
  i(1),
  t(")"),
  i(0),
})

local py_manim_wait = s("wa", {
  t("self.wait("),
  i(1),
  t(")"),
  i(0),
})

ls.add_snippets("python", { py_manim_scene, py_manim_play, py_manim_wait })
