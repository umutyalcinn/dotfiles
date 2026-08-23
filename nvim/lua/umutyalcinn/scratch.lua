local scratch_buf = nil

function OpenScratchBuffer()
  if scratch_buf and vim.api.nvim_buf_is_valid(scratch_buf) then
    vim.api.nvim_set_current_buf(scratch_buf)
    return
  end

  scratch_buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_name(scratch_buf, "Scratch")

  vim.bo[scratch_buf].buftype = "nofile"
  vim.bo[scratch_buf].bufhidden = "hide"
  vim.bo[scratch_buf].swapfile = false
  vim.bo[scratch_buf].modifiable = true
  vim.bo[scratch_buf].filetype = "markdown"

  vim.api.nvim_create_autocmd("BufWriteCmd", {
    buffer = scratch_buf,
    callback = function()
      vim.notify("Scratch buffer is temporary, not writable to disk", vim.log.levels.WARN)
    end,
  })

  vim.api.nvim_set_current_buf(scratch_buf)
end

vim.keymap.set("n", "<leader>s", OpenScratchBuffer, {
  desc = "Open scratch buffer"
})
