#global module:false

module.exports = (grunt) ->

    # Project configuration.
    grunt.initConfig

        # Metadata.
        pkg: grunt.file.readJSON("package.json")
        banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

        mochaTest:
            single:
                options:
                    reporter: 'spec'
                    require: ['coffee-script']
                src: ['test/test.constraint.coffee']
            test:
                options:
                    reporter: 'spec'
                    require: ['coffee-script']
                src: ['test/**/*.coffee']
            generate:
                options:
                    reporter: 'markdown'
                    require: 'coffee-script'
                    captureFile: 'test/test.md'
                src: ['test/**/*.coffee']
            # coverage:
            #     options:
            #         reporter: 'html-cov',
            #         quiet: true,
            #         captureFile: 'coverage.html'
            #     src: ['test/**/*.coffee']

        groc:
            generate:
                options:
                    "out": "doc/"
                javascript: [
                    "tasks/*.coffee", "README.md", "test.md"
                ]
            github:
                options:
                    "out": "doc/"
                    "github": true
                javascript: [
                    "tasks/*.coffee", "README.md", "test.md"
                ]

        # watch:
        #     gruntfile:
        #         files: "<%= jshint.gruntfile.src %>"
        #         tasks: ["jshint:gruntfile"]

        #     lib_test:
        #         files: "<%= jshint.lib_test.src %>"
        #         tasks: ["jshint:lib_test"]


    # These plugins provide necessary tasks.
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-mocha-test"
    grunt.loadNpmTasks "grunt-groc"

    # Default task.
    grunt.registerTask "default", ["mochaTest:test"]

    grunt.registerTask "doc", ["mochaTest:generate", "groc:generate"]
    grunt.registerTask "docupload", ["mochaTest:generate", "groc:github"]
