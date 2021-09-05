function gc --wraps=git\ for-each-ref\ --format=\'\%\(refname:short\)\'\ refs/heads\ \|\ fzf\ \|\ xargs\ git\ checkout --description alias\ gc=git\ for-each-ref\ --format=\'\%\(refname:short\)\'\ refs/heads\ \|\ fzf\ \|\ xargs\ git\ checkout
  git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout $argv; 
end
