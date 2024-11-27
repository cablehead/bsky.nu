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

    let extracted = $extracted | first

    # Construct the AT URL
    $"at://($extracted.handle)/app.bsky.feed.post/($extracted.post_id)"
}

export def get-post-thread [at_uri: string] {
    http get $"($API_BASE)/app.bsky.feed.getPostThread?uri=($at_uri)" | get thread
}

