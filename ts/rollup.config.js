import typescript from '@rollup/plugin-typescript';
import json from '@rollup/plugin-json';
import dts from 'rollup-plugin-dts';

export default [
  {
    input: 'src/index.ts',
    output: [
      {
        file: 'dist/index.js',
        format: 'cjs'
      },
      {
        file: 'dist/index.esm.js',
        format: 'es'
      },
      {
        file: 'dist/index.umd.js',
        format: 'umd',
        name: 'keeplistSocial',
        globals: {
          'keeplist-social': 'keeplistSocial'
        }
      }
    ],
    plugins: [
      typescript(),
      json({
        preferConst: true
      })
    ]
  },
  {
    input: 'dist/src/index.d.ts',
    output: [{ file: 'dist/index.d.ts', format: 'es' }],
    plugins: [dts()]
  }
]; 