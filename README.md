### Setup ssh-rsa

```ssh-keygen``` Leave all empty except file name.
<br/>
```ssh-agent```
<br/>
```ssh-add ~.ssh/your_ssh_id```
<br/>
```ssh-add -l```
<br/>
```cat ~.ssh/your_ssh_id.pub```
<br/>
Add <b>Deploy keys</b> to github

### Release
```mvn release:prepare release:perform```