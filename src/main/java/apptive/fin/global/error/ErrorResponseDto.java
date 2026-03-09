package apptive.fin.global.error;

import lombok.Builder;
import org.springframework.http.ResponseEntity;

@Builder
public record ErrorResponseDto(
        String code,
        String message
) {
    public static ResponseEntity<ErrorResponseDto> toResponseEntity(ErrorCode errorCode) {
        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(ErrorResponseDto.builder()
                        .code(errorCode.getCode())
                        .message(errorCode.getMessage())
                        .build()
                );
    }
}
