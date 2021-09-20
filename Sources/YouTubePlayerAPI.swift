import Combine
import Foundation

// MARK: - YouTubePlayerAPI

/// The YouTubePlayerAPI
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Functions
public typealias YouTubePlayerAPI = YouTubePlayerEventAPI
    & YouTubePlayerVideoAPI
    & YouTubePlayer360DegreePerspectiveAPI
    & YouTubePlayerPlaylistAPI
    & YouTubePlayerVolumeAPI
    & YouTubePlayerPlaybackRateAPI
    & YouTubePlayerPlaybackAPI
    & YouTubePlayerVideoInformationAPI

// MARK: - YouTubePlayerEventAPI

/// The YouTubePlayerEventAPI
public protocol YouTubePlayerEventAPI: AnyObject {
    
    /// A Publisher that emits the current YouTubePlayer State
    var statePublisher: AnyPublisher<YouTubePlayer.State, Never> { get }
    
    /// A Publisher that emits the current YouTubePlayer VideoState
    var videoStatePublisher: AnyPublisher<YouTubePlayer.VideoState, Never> { get }
    
    /// A Publisher that emits the current YouTubePlayer PlaybackQuality
    var playbackQualityPublisher: AnyPublisher<YouTubePlayer.PlaybackQuality, Never> { get }
    
    /// A Publisher that emits the current YouTubePlayer PlaybackRate
    var playbackRatePublisher: AnyPublisher<YouTubePlayer.PlaybackRate, Never> { get }
    
}

// MARK: - YouTubePlayerVideoAPI

/// The YouTubePlayerVideoAPI
/// Playback controls and player settings
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Playback_controls
public protocol YouTubePlayerVideoAPI: AnyObject {
    
    /// Load YouTubePlayer Source
    /// - Parameter source: The YouTubePlayer Source to load
    func load(
        source: YouTubePlayer.Source
    )
    
    /// Plays the currently cued/loaded video
    func play()
    
    /// Pauses the currently playing video
    func pause()
    
    /// Stops and cancels loading of the current video
    func stop()
    
    /// Seeks to a specified time in the video
    /// - Parameters:
    ///   - seconds: The seconds parameter identifies the time to which the player should advance
    ///   - allowSeekAhead: Determines whether the player will make a new request to the server
    func seek(
        to seconds: Double,
        allowSeekAhead: Bool
    )
    
}

// MARK: - YouTubePlayer360DegreePerspectiveAPI

/// The YouTubePlayer360DegreePerspectiveAPI
/// Controlling playback of 360° videos
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Spherical_Video_Controls
public protocol YouTubePlayer360DegreePerspectiveAPI: AnyObject {
    
    /// Retrieves properties that describe the viewer's current perspective
    /// - Parameter completion: The completion closure
    func get360DegreePerspective(
        completion: @escaping (Result<YouTubePlayer.Perspective360Degree, Error>) -> Void
    )
    
    /// Sets the video orientation for playback of a 360° video
    /// - Parameter perspective360Degree: The Perspective360Degree
    func set(
        perspective360Degree: YouTubePlayer.Perspective360Degree
    )
    
}

// MARK: - YouTubePlayerPlaylistAPI

/// The YouTubePlayerPlaylistAPI
/// Playing a video in a playlist, setting playback behavior for playlists and retrieving playlist information
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#playing-a-video-in-a-playlist
public protocol YouTubePlayerPlaylistAPI: AnyObject {
    
    /// This function loads and plays the next video in the playlist
    func nextVideo()
    
    /// This function loads and plays the previous video in the playlist
    func previousVideo()
    
    /// This function loads and plays the specified video in the playlist
    /// - Parameter index: The index of the video that you want to play in the playlist
    func playVideo(
        at index: UInt
    )
    
    /// This function indicates whether the video player should continuously play a playlist
    /// or if it should stop playing after the last video in the playlist ends
    /// - Parameter enabled: Bool value if is enabled
    func setLoop(
        enabled: Bool
    )
    
    /// This function indicates whether a playlist's videos should be shuffled
    /// so that they play back in an order different from the one that the playlist creator designated
    /// - Parameter enabled: Bool value if is enabled
    func setShuffle(
        enabled: Bool
    )
    
    /// This function returns an array of the video IDs in the playlist as they are currently ordered
    /// - Parameter completion: The completion closure
    func getPlaylist(
        completion: @escaping (Result<[String], Error>) -> Void
    )
    
    /// This function returns the index of the playlist video that is currently playing.
    /// - Parameter completion: The completion closure
    func getPlayistIndex(
        completion: @escaping (Result<UInt, Error>) -> Void
    )
    
}

// MARK: - YouTubePlayerVolumeAPI

/// The YouTubePlayerVolumeAPI
/// Changing the player volume
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#changing-the-player-volume
public protocol YouTubePlayerVolumeAPI: AnyObject {
    
    /// Mutes the player
    func mute()
    
    /// Unmutes the player
    func unmute()
    
    /// Returns Bool value if the player is muted
    /// - Parameter completion: The completion closure
    func isMuted(
        completion: @escaping (Result<Bool, Error>) -> Void
    )
    
    /// Returns the player's current volume, an integer between 0 and 100
    /// - Parameter completion: The completion closure
    func getVolume(
        completion: @escaping (Result<UInt, Error>) -> Void
    )
    
    /// Sets the volume.
    /// Accepts an integer between 0 and 100
    /// - Parameter volume: The volume
    func set(
        volume: UInt
    )
    
}

// MARK: - YouTubePlayerPlaybackRateAPI

/// The YouTubePlayerPlaybackRateAPI
/// Setting the playback rate
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Playback_rate
public protocol YouTubePlayerPlaybackRateAPI: AnyObject {
    
    /// This function retrieves the playback rate of the currently playing video
    /// - Parameter completion: The completion closure
    func getPlaybackRate(
        completion: @escaping (Result<YouTubePlayer.PlaybackRate, Error>) -> Void
    )
    
    /// This function sets the suggested playback rate for the current video
    /// - Parameter playbackRate: The playback rate
    func set(
        playbackRate: YouTubePlayer.PlaybackRate
    )
    
    /// This function returns the set of playback rates in which the current video is available
    /// - Parameter completion: The completion closure
    func getAvailablePlaybackRates(
        completion: @escaping (Result<[YouTubePlayer.PlaybackRate], Error>) -> Void
    )
    
}

// MARK: - YouTubePlayerPlaybackAPI

/// The YouTubePlayerPlaybackAPI
/// Playback status
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Playback_status
public protocol YouTubePlayerPlaybackAPI: AnyObject {
    
    /// Returns a number between 0 and 1 that specifies the percentage of the video that the player shows as buffered
    /// - Parameter completion: The completion closure
    func getVideoLoadedFraction(
        completion: @escaping (Result<Double, Error>) -> Void
    )
    
    /// Returns the state of the player video
    /// - Parameter completion: The completion closure
    func getVideoState(
        completion: @escaping (Result<YouTubePlayer.VideoState, Error>) -> Void
    )
    
    /// Returns the elapsed time in seconds since the video started playing
    /// - Parameter completion: The completion closure
    func getCurrentTime(
        completion: @escaping (Result<UInt, Error>) -> Void
    )
    
}

// MARK: - YouTubePlayerVideoInformationAPI

/// The YouTubePlayerVideoInformationAPI
/// Retrieving video information
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Retrieving_video_information
public protocol YouTubePlayerVideoInformationAPI: AnyObject {
    
    /// Returns the duration in seconds of the currently playing video
    /// - Parameter completion: The completion closure
    func getDuration(
        completion: @escaping (Result<UInt, Error>) -> Void
    )
    
    /// Returns the YouTube.com URL for the currently loaded/playing video
    /// - Parameter completion: The completion closure
    func getVideoURL(
        completion: @escaping (Result<String, Error>) -> Void
    )
    
    /// Returns the embed code for the currently loaded/playing video
    /// - Parameter completion: The completion closure
    func getVideoEmbedCode(
        completion: @escaping (Result<String, Error>) -> Void
    )
    
}
