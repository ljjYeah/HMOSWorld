import { util } from '@kit.ArkTS'

export function bufferToString(buffer: ArrayBufferLike): string {
  let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
  let result = textDecoder.decodeWithStream(new Uint8Array(buffer), { stream: true });
  return result;
}