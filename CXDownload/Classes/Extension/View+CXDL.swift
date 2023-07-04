//
//  View+CXDL.swift
//  CXDownload
//
//  Created by chenxing on 2022/8/20.
//

import Foundation
#if os(iOS) || os(tvOS) || os(macOS)
#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

extension CXDownloadBase where T : CXDView {
    
    /// Pauses the download task through a specified url.
    public func resumeDownloadTask(_ url: String) {
        CXDownloadManager.shared.resumeWithURLString(url)
    }
    
    /// Pauses the download task through a specified url.
    public func pauseDownloadTask(_ url: String) {
        CXDownloadManager.shared.pauseWithURLString(url)
    }
    
    /// Cancels the download task through a specified url.
    public func cancelDownloadTask(_ url: String) {
        CXDownloadManager.shared.cancelWithURLString(url)
    }
    
    /// Deletes the task, cache, target file through the specified url, target directory and custom filename..
    public func deleteTaskAndCache(url: String, atDirectory directory: String? = nil, fileName: String? = nil) {
        CXDownloadManager.shared.deleteTaskAndCache(url: url, atDirectory: directory, fileName: fileName)
    }
    
}

#endif
