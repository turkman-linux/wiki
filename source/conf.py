# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Türkmen Wiki'
copyright = 'Türkmen Linux 2023'
author = 'turkman'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = []

language = 'tr'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'

html_static_path = ['_static']

html_theme_options = {
    'font_family' : 'monospace',
    'footnote_bg': 'none',
    'page_width': '100%',
    'body_max_width': 'auto',
    'logo': 'logo.svg',

}
html_sidebars = {
    '**': [
        'about.html',
        'navigation.html',
    ]
}
