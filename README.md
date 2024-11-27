```nushell

$ use bsky.nu *

$ to-at-url "https://bsky.app/profile/ndyg.ca/post/3lbw2wqfsq22s"
at://did:plc:mojc3pw3bc24ncnhbsd7ceeh/app.bsky.feed.post/3lbw2wqfsq22s

$ get-post-thread (to-at-url "https://bsky.app/profile/ndyg.ca/post/3lbw2wqfsq22s") | get replies | each { get post.record.text }
───┬────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 0 │ experimenting with:                                                                                                                                
   │                                                                                                                                                    
   │ ```                                                                                                                                                
   │ http get "https://public.api.bsky.app/xrpc/app.bsky.feed.getPostThread?uri=at://did:plc:mojc3pw3bc24ncnhbsd7ceeh/app.bsky.feed.post/3lbw2wqfsq22s" 
   │ ```                                                                                                                                                
───┴────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
