#!/bin/sh

echo "checking links..."
for colorscheme in $(find ./submodules -wholename "./submodules/*/colors/*.vim" -type f); do
  basescheme="$(basename $colorscheme)"
  if [ ! -f "colors/$basescheme" ]; then
    pushd ./colors
    echo "linking to $(greadlink -f .) to ../$colorscheme"
    ln -sf "../$colorscheme"
    popd
  fi
done

git add ./colors
