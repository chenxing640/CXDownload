//
//  ImageView+CXDL.swift
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

extension CXDownloadBase where T : CXDImageView {
    
    /// Executes an asynchronous download by the url and other parameters.
    public func download(
        url: String,
        toDirectory directory: String? = nil,
        fileName: String? = nil,
        progress: @escaping (CXDownloadModel) -> Void,
        success: @escaping (CXDownloadModel) -> Void,
        failure: @escaping (CXDownloadModel) -> Void)
    {
        return CXDownloadManager.shared.download(
            url: url,
            toDirectory: directory,
            fileName: fileName,
            progress: progress,
            success: success,
            failure: failure)
    }
    
}

#endif
