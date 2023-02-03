local overseer = require('overseer')

-- TODO: complete
return {
    name = 'java build',
    builder = function(_)
        local file = vim.fn.expand('%:p')
        return {
            cmd = { 'javac' },
            args = { file, '-d', './bin' },
            components = { { 'on_output_quickfix' }, 'default' },
            cwd = vim.fn.getcwd(),
        }
    end,
    desc = 'build a single java file with javac and output in bin/file',
    tags = { overseer.TAG.BUILD },
    condition = { filetype = { 'java' } },
}
