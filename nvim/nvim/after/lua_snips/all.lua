-- [[
-- Define global snips here
--
-- ]]

local upvest_copyright = {
  "// Upvest Confidential",
  "//",
  "// Copyright 2020 - 2023 Upvest GmbH. All Rights Reserved.",
  "//",
  "// NOTICE:  All information contained herein is, and remains the property",
  "// of Upvest GmbH. The intellectual and technical concepts contained herein",
  "// are proprietary to Upvest GmbH and are protected by trade secret or",
  "// copyright law. Dissemination of this information or reproduction of this",
  "// material is strictly forbidden unless prior written permission is",
  "// obtained from Upvest GmbH."
}

local ls = require("luasnip")
local s = ls.snippet

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  s(
    { trig = "hi" },
    { t("Hello world!") }
  ),

  s(
    { trig = "copyr" },
    { t(upvest_copyright) }
  ),

  s(
    { trig = "tfvar" },
    { 
      t("variable \""), i(1, "name"), t("\" {"),
      t("type = "), i(2, "type"),
      t("default = "), i(3, "default"),
      t("description = "), i(4, "description"),
      t("}"),
    }
  )

}



  --
  --require("luasnip").snippet(
  --  { trig = "tfvar" },
  --  i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
  --)

