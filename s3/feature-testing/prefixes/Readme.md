```sh
aws s3 mb s3://ethereal-prefixes-fun
```

# Creates a "folder" "hello/" and file "/"
```sh
aws s3api put-object --bucket ethereal-prefixes-fun --key hello/ --body Readme.md
```
# Creates a "folder" "hello/" with no file. both are listed as of type "folder"
```sh
aws s3api put-object --bucket ethereal-prefixes-fun --key hello/
```

# 1024 length
```sh
aws s3api put-object --bucket ethereal-prefixes-fun --key Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Sed/vel/sollicitudin/justo/nec/efficitur/est/Sed/at/orci/id/libero/euismod/maximus/Curabitur/in/quam/nec/ex/hendrerit/ullamcorper/at/at/orci/Phasellus/vel/commodo/elit/Ut/ut/ante/nunc/Nullam/feugiat/vulputate/ex/ac/consequat/nunc/porta/quis/Nulla/posuere/convallis/malesuada/Sed/scelerisque/eleifend/mauris/eu/consectetur/elit/efficitur/eget/Interdum/et/malesuada/fames/ac/ante/ipsum/primis/in/faucibus/Morbi/scelerisque/dictum/suscipit/Integer/pharetra/mollis/ante/non/interdum/leo/convallis/et/Pellentesque/vulputate/aliquam/tellus/condimentum/consectetur/Vestibulum/sed/diam/in/quam/rhoncus/porta/Proin/mauris/nunc/laoreet/eget/turpis/non/iaculis/luctus/leo/Nulla/posuere/dolor/et/justo/rhoncus/vel/rhoncus/lorem/dapibus/Vestibulum/volutpat/ante/et/pulvinar/condimentum/Aenean/malesuada/ante/ac/tellus/congue/sed/dictum/erat/commodo/Nullam/efficitur/diam/neque/gravida/dapibus/nisl/sagittis/euismod/Phasellus/cursus/sapien/quis/molestie/in/quam/nec/ex/hendrerit/ata/
```

# surpass 1024 errors as expected since to check key length they probably just check len(x)
```sh
aws s3api put-object --bucket ethereal-prefixes-fun --key Lorem/ipsum/dolor/sit/amet/consectetur/adipiscing/elit/Sed/vel/sollicitudin/justo/nec/efficitur/est/Sed/at/orci/id/libero/euismod/maximus/Curabitur/in/quam/nec/ex/hendrerit/ullamcorper/at/at/orci/Phasellus/vel/commodo/elit/Ut/ut/ante/nunc/Nullam/feugiat/vulputate/ex/ac/consequat/nunc/porta/quis/Nulla/posuere/convallis/malesuada/Sed/scelerisque/eleifend/mauris/eu/consectetur/elit/efficitur/eget/Interdum/et/malesuada/fames/ac/ante/ipsum/primis/in/faucibus/Morbi/scelerisque/dictum/suscipit/Integer/pharetra/mollis/ante/non/interdum/leo/convallis/et/Pellentesque/vulputate/aliquam/tellus/condimentum/consectetur/Vestibulum/sed/diam/in/quam/rhoncus/porta/Proin/mauris/nunc/laoreet/eget/turpis/non/iaculis/luctus/leo/Nulla/posuere/dolor/et/justo/rhoncus/vel/rhoncus/lorem/dapibus/Vestibulum/volutpat/ante/et/pulvinar/condimentum/Aenean/malesuada/ante/ac/tellus/congue/sed/dictum/erat/commodo/Nullam/efficitur/diam/neque/gravida/dapibus/nisl/sagittis/euismod/Phasellus/cursus/sapien/quis/molestie/in/quam/nec/ex/hendrerit/ata/hello.txt --body Readme.md
```

