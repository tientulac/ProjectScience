export class ResponseBase {
  Status!: number;
  Message!: string;
  Data!: any;
}

export interface LooseObject {
  [key: string]: any;
}

