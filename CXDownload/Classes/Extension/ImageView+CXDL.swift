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
    @discardableResult public func download(
        url: String,
        to targetDirectory: String? = nil,
        customFileName: String? = nil,
        progress: @escaping (_ progress: Int) -> Void,
        success: @escaping CXDownloader.SuccessClosure,
        failure: @escaping CXDownloader.FailureClosure) -> CXDownloader?
    {
        return CXDownloadManager.shared.asyncDownload(url: url, customDirectory: targetDirectory, customFileName: customFileName, progress: { _progress in
            progress(Int(_progress * 100))
        }, success: { filePath in
            success(filePath)
        }) { error in
            failure(error)
        }
    }
    
}

#endif
