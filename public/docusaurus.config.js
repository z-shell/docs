// @ts-nocheck
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: '❮ ZI ❯',
  tagline: 'A Swiss Army Knife for Zsh - Unix shell.',
  url: 'https://z-shell.pages.dev',
  baseUrl: '/',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'log',
  favicon: 'img/favicon.ico',
  organizationName: 'z-shell',
  projectName: 'zi',

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/z-shell/docs/tree/main/public/',
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/z-shell/docs/tree/main/public/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
    metadata: [{name: 'twitter:card', content: 'summary'}],
	colorMode: {
      defaultMode: 'dark',
      disableSwitch: false,
      respectPrefersColorScheme: false,
      switchConfig: {
        darkIcon: '🌙',
        darkIconStyle: {
          marginLeft: '2px',
        },
        // Unicode icons such as '\u2600' will work
        // Unicode with 5 chars require brackets: '\u{1F602}'
        lightIcon: '\u{1F602}',
        lightIconStyle: {
          marginLeft: '1px',
		navbar: {
        title: '❮ ZI ❯',
        logo: {
          alt: 'ZI Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Wiki',
          }
//          {to: '/blog', label: 'Blog', position: 'left'},
//          {
//            href: 'https://github.com/z-shell/zi',
//            label: 'GitHub',
//            position: 'right',
//          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Knowledge base:',
            items: [
              {
                label: 'ZI Wiki',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Github Discussions',
                href: 'https://github.com/z-shell/zi/discussions',
              },
            ],
          },
          {
            title: 'More',
            items: [
//             {
//                label: 'Blog',
//                to: '/blog',
//              },
              {
                label: 'GitHub',
                href: 'https://github.com/z-shell/zi',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Z-Shell ZI, Community.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
		  additionalLanguages: ['shell-session', 'bash', 'vim', 'git']
		},
    }),
};

module.exports = config;
