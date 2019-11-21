import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  startDate: Date;

  constructor() {
    this.startDate = new Date();
  }

  getUptime(): number {
    return Date.now() - this.startDate.valueOf();
  }
}
