return {
  -- render-markdown.nvim: disable background rendering for mermaid code blocks
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        disable_background = { "mermaid" },
      },
    },
  },
}
