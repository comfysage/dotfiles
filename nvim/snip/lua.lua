return {
  s("req", fmt([[local {} = R '{}']], { i(1), i(2) })),
  s("pcall", fmt([[local status, _ = pcall(require, '{}')
if not status then return end
  ]], { i(1) }))
}
