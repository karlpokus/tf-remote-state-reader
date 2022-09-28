# the problem
There is no terraform command to list or verify *remote* state. `tf state list` does not care where the state is located.

When you work with gazillions of terraformed resources and abstracted state configuration it's nice to be able to verify that your state is safe and sound in s3.

I do think there's a tf state issue with working with local modules from the file system too but I'm not sure about this.

# requirements
- aws cli
- [peco](https://github.com/peco/peco)
- jq

# usage
````bash
# interactively pull tf remote state from s3 and dump the resources to stdout.
$ ./pull.sh <aws_profile>
````

# license
MIT
