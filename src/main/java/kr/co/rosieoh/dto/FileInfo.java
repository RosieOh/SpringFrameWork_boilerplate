package kr.co.rosieoh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileInfo {
    private String saveFolder;
    private String originFile;
    private String saveFile;
}
