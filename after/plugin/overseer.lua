local overseer = require('overseer')

overseer.setup {
    dap = true,
    templates = {
        'builtin',
        'ccppbuild'
    }
}
