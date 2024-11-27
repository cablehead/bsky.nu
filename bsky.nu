const API_BASE = "https://public.api.bsky.app/xrpc"

export def to-at-url [url: string] {
    # Extract the components from the URL using parse
    let extracted = ($url | parse --regex 'https://bsky.app/profile/(?<handle>[^/]+)/post/(?<post_id>[^/]+)')

    # Check if parsing was unsuccessful
    if ($extracted | is-empty) {
        return (error make {
            msg: "Invalid Bluesky post URL format"
            label: {
                text: "The URL doesn't match the expected structure"
                span: (metadata $url).span
            }
        })
    }

    let post = $extracted | first
    let did = get-profile $post.handle | get did

    # Construct the AT URL
    $"at://($did)/app.bsky.feed.post/($post.post_id)"
}

export def get-post-thread [at_uri: string] {
    http get $"($API_BASE)/app.bsky.feed.getPostThread?uri=($at_uri)" | get thread
}

export def get-profile [handle: string] {
    http get $"($API_BASE)/app.bsky.actor.getProfile?actor=($handle)"
}
