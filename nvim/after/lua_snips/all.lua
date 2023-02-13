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

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "hi" },
    { t("Hello world!") }
  ),
  

  require("luasnip").snippet(
    { trig = "copyr" },
    { t(upvest_copyright) }
  ),

}
